if ls *.cpp 2> /dev/null 2>&1; then
    # Jika ada, tampilkan versi GCC
    echo gcc --version | head -n 1 | awk '{print $3}'
fi
