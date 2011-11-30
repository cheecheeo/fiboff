# python fibonacci_backoff.py

import time

# http://www.daniweb.com/software-development/python/code/216645
def fibonacci():
    """A generator for Fibonacci numbers."""
    a, b = 0, 1
    while True:
        yield a
        a, b = b, a + b

fibs = fibonacci()

def backoff():
    sleep_time = fibs.next()
    print 'Sleeping for', str(sleep_time) + 's'
    time.sleep(sleep_time)

if __name__ == '__main__':
    while True:
      backoff()
