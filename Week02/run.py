import mean_v2
import time

if __name__ == '__main__':
    begin = time.time()
    a = mean_v2.run()
    end = time.time()
    print(end - begin, 'S')
    print(a)
