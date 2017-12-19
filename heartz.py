from __future__ import print_function, division
import warnings
from nilmtk import DataSet
from matplotlib import rcParams
import matplotlib.pyplot as plt

warnings.filterwarnings("ignore")

rcParams['figure.figsize'] = (13, 6)
plt.style.use('ggplot')

# Open REDD DataSet (CSV + metadata)
redd = DataSet('/home/mpoloni/Escritorio/Heartz/datasets/agraciada/', format='CSV')

elec = redd.buildings[1].elec

# print(redd.__doc__)
# print(nilmtk.DataStore.__doc__)

# print(elec)
# print(elec.__doc__)
print(elec.mains())

# print(elec.sample_period())

print(elec.mains().power_series_all_data().head())
# print(elec.proportion_of_energy_submetered())

# print(elec.mains().total_energy())
# returns kWh

# Disaggregation fhmm_exact
# fhmm = fhmm_exact.FHMM()
#
# start = time.time()
# fhmm.train(elec)
# end = time.time()
# print("Runtime =", end - start, "seconds.")


# building = rd.buildings[1]
# elec = rd.buildings[1].elec
# elec.mains().total_energy()
# elec.draw_wiring_graph()
#
# co = CombinatorialOptimisation()
# co_train = co.train(elec)
# co_dissag = co.disaggregate(elec)
