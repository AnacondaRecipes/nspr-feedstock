#!/bin/bash
set -ex

for test_dir in nspr/lib/tests; do
    cp -v "$PREFIX/lib"/libnspr4${SHLIB_EXT}* "$test_dir/"
    cp -v "$PREFIX/lib"/libplc4${SHLIB_EXT}* "$test_dir/"
    cp -v "$PREFIX/lib"/libplds4${SHLIB_EXT}* "$test_dir/"
done

for test in nspr/lib/tests/*; do
    [ -x "$test" ] || continue
    [ -f "$test" ] || continue
    case "$(basename "$test")" in
        *.dylib|*.so) continue ;;
    esac
    echo "Running: $(basename "$test")"
    "$test"
done

echo "All tests completed"