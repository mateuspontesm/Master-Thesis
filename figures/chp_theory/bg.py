import matplotlib.pyplot as plt
import matplotlib.style as style
from matplotlib import rcParams, rc
import seaborn as sns
import numpy as np
from matplotlib.ticker import FormatStrFormatter
from matplotlib.backends.backend_pdf import PdfPages

sns.set_context("paper")
rcParams['font.family'] = 'sans-serif'
rcParams['font.sans-serif'] = ['Utopia', 'DejaVu Sans',
                               'Lucida Grande', 'Verdana']
rc('text', usetex=True)
style.use('seaborn')
FigSize = (9, 5)
sns.set(rc={'figure.figsize': FigSize})
sns.set_style('white')
c_map = sns.color_palette()

xs = np.arange(0, 10000+1)
y1s = 0.95*np.ones(xs.shape)
y2s = (2/3)*np.ones(xs.shape)
y3s = (1/4)*np.ones(xs.shape)
y0s = np.zeros(xs.shape)
# %%
fig, ax = plt.subplots()
plt.plot(xs, y1s, color='black')
kk = 2
ax.yaxis.set_major_formatter(FormatStrFormatter('%.2f'))
plt.xlim(0, 12000)
plt.ylim(0, 1)
plt.fill_between(xs[308:-kk], y1s[308:-kk], where=y1s[308:-kk] >= 1/4, color=c_map[1], label='BG1')
plt.fill_between(xs, y1s, where=xs <= 308, color=c_map[0], label='BG2')
plt.fill_between(xs, y0s, y2s, where=xs <= 3840, color=c_map[0], label='_noLabel')
plt.fill_between(xs, y0s, y3s, color=c_map[0], label='_noLabel')
plt.tick_params(right=True, top=True, labelright=True, labeltop=True, rotation=0)
plt.tick_params(direction='inout')
plt.yticks([1/4, 2/3, 95/100])
plt.xticks([308, 3840, 8448])
plt.grid(True, color='black', alpha=0.5, linestyle='solid')
plt.xlabel('Information block size (k)')
plt.ylabel('Code Rate')
plt.text(6000, 2/3, 'BG1', fontsize=18)
plt.text(1500, 0.4, 'BG2', fontsize=18)
plt.legend(loc='lower right')
plt.tight_layout()
with PdfPages('figures/chp_theory/figureBG.pdf') as pdf:
    pdf.savefig(facecolor='w')
#  %%
