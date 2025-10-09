#!/usr/bin/env fish

# Memeriksa keberadaan file .c atau .cpp
if test (count *.c) -gt 0 -o (count *.cpp) -gt 0
    # Jika ada, tampilkan versi GCC
    echo "$(gcc --version | head -n 1 | awk '{print $3}')"
end
