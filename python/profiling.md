## Links :
- https://toucantoco.com/en/tech-blog/tech/python-performance-optimization
- https://wiki.python.org/moin/PythonSpeed/PerformanceTips#Visualizing_Profiling_Results

## Quick run :
Generate the `output.pstats` file with any method :
- python -m profile -o output.pstats path/to/your/script arg1 arg2
- or use Pycharm pro, to run the python profiler (same as above)

Visualize in a web browser :
- snakeviz output.pstats

## External tools :
Yappi : Yet Another Python Profiler, but this time support Multithread/CPU time profiling
- pip install yappi
