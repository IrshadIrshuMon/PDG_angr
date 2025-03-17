import angr
import networkx as nx
import logging
import os
import subprocess

logging.getLogger("angr").setLevel(logging.WARNING)

base_dir = os.path.dirname(os.path.abspath(__file__))
bin_dir = os.path.join(base_dir, "bin")
output_dir = os.path.join(base_dir, "output")
cfg_dir = os.path.join(output_dir, "cfg")
ddg_dir = os.path.join(output_dir, "ddg")
pdg_dir = os.path.join(output_dir, "pdg")

for directory in [cfg_dir, ddg_dir, pdg_dir]:
    dot_folder = os.path.join(directory, "dot")
    png_folder = os.path.join(directory, "png")
    os.makedirs(dot_folder, exist_ok=True)
    os.makedirs(png_folder, exist_ok=True)

if not os.path.exists(bin_dir):
    exit(1)

binary_files = [f for f in os.listdir(bin_dir) if os.path.isfile(os.path.join(bin_dir, f))]
if not binary_files:
    exit(1)

for binary in binary_files:
    binary_path = os.path.join(bin_dir, binary)
    try:
        proj = angr.Project(binary_path, auto_load_libs=False)
        cfg = proj.analyses.CFGEmulated(
            context_sensitivity_level=2,
            keep_state=True,
            state_add_options=angr.options.refs
        )
        cfg_graph = nx.DiGraph()
        for node in cfg.graph.nodes():
            if hasattr(node, "addr"):
                node_id = f"{node.addr:x}"
                cfg_graph.add_node(node_id, label=f"0x{node.addr:x}")
        for node in cfg.graph.nodes():
            for succ in cfg.graph.successors(node):
                if hasattr(node, "addr") and hasattr(succ, "addr"):
                    u = f"{node.addr:x}"
                    v = f"{succ.addr:x}"
                    cfg_graph.add_edge(u, v)
        cfg_dot_path = os.path.join(cfg_dir, "dot", f"{binary}.dot")
        cfg_png_path = os.path.join(cfg_dir, "png", f"{binary}.png")
        nx.nx_pydot.write_dot(cfg_graph, cfg_dot_path)
        subprocess.run(["dot", "-Tpng", cfg_dot_path, "-o", cfg_png_path],
                       stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)

        ddg_graph = nx.DiGraph()
        max_block_limit = 500
        for func_addr, func in sorted(proj.kb.functions.items()):
            if func.name.startswith("Unresolvable") or not func.block_addrs:
                continue
            if len(func.block_addrs) > max_block_limit:
                print(f"Skipping DDG for {func.name} - too many blocks: {len(func.block_addrs)}")
                continue
            try:
                ddg = proj.analyses.DDG(cfg=cfg, start=func.addr)
                for src, dst in ddg.graph.edges():
                    if hasattr(src, "stmt_idx") and hasattr(dst, "stmt_idx"):
                        src_addr = src.ins_addr if hasattr(src, "ins_addr") else src.addr
                        dst_addr = dst.ins_addr if hasattr(dst, "ins_addr") else dst.addr
                        
                        src_node = f"{func.name}_{src_addr:x}_{src.stmt_idx}"
                        dst_node = f"{func.name}_{dst_addr:x}_{dst.stmt_idx}"
                        
                        src_label = f"{func.name}: 0x{src_addr:x}:{src.stmt_idx}"
                        dst_label = f"{func.name}: 0x{dst_addr:x}:{dst.stmt_idx}"
                        
                        ddg_graph.add_node(src_node, label=src_label)
                        ddg_graph.add_node(dst_node, label=dst_label)
                        ddg_graph.add_edge(src_node, dst_node)
            except Exception as e:
                print(f"Error generating DDG for {func.name}: {str(e)}")
                continue
        
        ddg_dot_path = os.path.join(ddg_dir, "dot", f"{binary}.dot")
        ddg_png_path = os.path.join(ddg_dir, "png", f"{binary}.png")   
        if ddg_graph.number_of_edges() > 0:
            nx.nx_pydot.write_dot(ddg_graph, ddg_dot_path)
            subprocess.run(["dot", "-Tpng", ddg_dot_path, "-o", ddg_png_path],
                           stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
            print(f"DDG generated for {binary} with {ddg_graph.number_of_edges()} edges")
        else:
            print(f"No DDG edges found for {binary}")
        
        pdg_graph = nx.DiGraph()
        for node in cfg.graph.nodes():
            if hasattr(node, "addr"):
                node_id = f"{node.addr:x}"
                pdg_graph.add_node(node_id, label=f"0x{node.addr:x}")
        for node in cfg.graph.nodes():
            for succ in cfg.graph.successors(node):
                if hasattr(node, "addr") and hasattr(succ, "addr"):
                    u = f"{node.addr:x}"
                    v = f"{succ.addr:x}"
                    pdg_graph.add_edge(u, v, type="control")

        for func_addr, func in sorted(proj.kb.functions.items()):
            if func.name.startswith("Unresolvable") or not func.block_addrs:
                continue
            if len(func.block_addrs) > max_block_limit:
                continue
            try:
                ddg = proj.analyses.DDG(cfg=cfg, start=func.addr)
                for src, dst in ddg.graph.edges():
                    if hasattr(src, "stmt_idx") and hasattr(dst, "stmt_idx"):
                        src_addr = src.ins_addr if hasattr(src, "ins_addr") else src.addr
                        dst_addr = dst.ins_addr if hasattr(dst, "ins_addr") else dst.addr
                        
                        src_id = f"{src_addr:x}"
                        dst_id = f"{dst_addr:x}"
                        
                        if src_id not in pdg_graph:
                            pdg_graph.add_node(src_id, label=f"0x{src_addr:x}:{src.stmt_idx}")
                        if dst_id not in pdg_graph:
                            pdg_graph.add_node(dst_id, label=f"0x{dst_addr:x}:{dst.stmt_idx}")
                        
                        pdg_graph.add_edge(src_id, dst_id, type="data")
            except Exception as e:
                print(f"Error generating PDG DDG for {func.name}: {str(e)}")
                continue

        for (u, v, attr) in pdg_graph.edges(data=True):
            edge_type = attr.get("type", "")
            if edge_type == "control":
                pdg_graph[u][v]["color"] = "red"
                pdg_graph[u][v]["style"] = "solid"
            elif edge_type == "data":
                pdg_graph[u][v]["color"] = "blue"
                pdg_graph[u][v]["style"] = "dashed"

        pdg_dot_path = os.path.join(pdg_dir, "dot", f"{binary}.dot")
        pdg_png_path = os.path.join(pdg_dir, "png", f"{binary}.png")
        nx.nx_pydot.write_dot(pdg_graph, pdg_dot_path)
        subprocess.run(["dot", "-Tpng", pdg_dot_path, "-o", pdg_png_path],
                       stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        
        print(f"CFG, DDG, and PDG generation complete for {binary}!")
    except Exception as e:
        print(f"Failed to analyze {binary}: {str(e)}")
