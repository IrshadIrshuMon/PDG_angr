import os
import subprocess

base_dir = os.path.dirname(os.path.abspath(__file__))
c_dir = os.path.join(base_dir, "c")
bin_dir = os.path.join(base_dir, "bin")
asm_dir = os.path.join(base_dir, "asm")
dis_dir = os.path.join(base_dir, "dis")

os.makedirs(bin_dir, exist_ok=True)
os.makedirs(asm_dir, exist_ok=True)
os.makedirs(dis_dir, exist_ok=True)

c_files = [f for f in os.listdir(c_dir) if f.endswith(".c")]

for c_file in c_files:
    c_file_path = os.path.join(c_dir, c_file)
    binary_file = os.path.splitext(c_file)[0]
    bin_file_path = os.path.join(bin_dir, binary_file)
    asm_file_path = os.path.join(asm_dir, f"{binary_file}.asm")
    dis_file_path = os.path.join(dis_dir, f"{binary_file}.dis")
    subprocess.run(["gcc", c_file_path, "-o", bin_file_path, "-O2", "-mno-avx2"], check=True)
    subprocess.run(["gcc", "-S", c_file_path, "-o", asm_file_path, "-O2", "-masm=intel"], check=True)
    subprocess.run(["strip", "--strip-debug", bin_file_path], check=True)
    with open(dis_file_path, "w") as dis_file:
        subprocess.run(["objdump", "-d", bin_file_path], stdout=dis_file, check=True)

