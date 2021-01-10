# distutils: language=c++
import numpy as np
cimport numpy as np
import pandas as pd


cdef target_mean_v2(data, y_name, x_name):
	cdef int i
	cdef int j
	cdef int n
	cdef float mean_y
	cdef dict dict_y = {}
	cdef list lst = [1, 2]
	result = np.zeros(data.shape[0])
	for i, j in zip(data[x_name], data[y_name]):
		if i not in dict_y:
			n = 1 # 计数
			lst[0] = j
			lst[1] = n
			dict_y[i] = lst
		else:
			dict_y[i][0] += j
			dict_y[i][1] += 1
	n = 0
	for i, j in zip(data[x_name], data[y_name]):
		mean_y = (dict_y[i][0] - j)/(dict_y[i][1] - 1)
		result[n] = mean_y
		n += 1
	return result


def run():
	y = np.random.randint(2, size=(5000, 1))
	x = np.random.randint(10, size=(5000, 1))
	data = pd.DataFrame(np.concatenate([y, x], axis=1), columns=['y', 'x'])
	result = target_mean_v2(data, 'y', 'x')
	return result