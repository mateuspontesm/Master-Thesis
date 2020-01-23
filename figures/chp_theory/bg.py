import matplotlib.pyplot as plt
import matplotlib.style as style
from matplotlib import rcParams, rc
import seaborn as sns
import numpy as np
from matplotlib.ticker import FormatStrFormatter
from matplotlib.backends.backend_pdf import PdfPages

sns.set_context("paper")
rc('font', **{'family': 'serif', 'serif': ['Times']})
rc('text', usetex=True)
style.use('seaborn')
FigSize = (9, 5)
sns.set(rc={'figure.figsize': FigSize})
sns.set_style('whitegrid')
c_map = sns.color_palette('pastel')
xs = np.arange(0, 10000+1)
y1s = 0.95*np.ones(xs.shape)
y2s = (2/3)*np.ones(xs.shape)
y3s = (1/4)*np.ones(xs.shape)
y0s = np.zeros(xs.shape)
# %%
fig, ax = plt.subplots()
plt.plot(xs, y1s, color='black')
color1 = '#FFDFD3'
color2 = '#cce1f2'
kk = 2
ax.yaxis.set_major_formatter(FormatStrFormatter('%.2f'))
plt.xlim(0, 12000)
plt.ylim(0, 1)
plt.fill_between(xs[3824:], y1s[3824:], y3s[3824:],
                 where=y1s[3824:] >= 1/4, color=color1,
                 label='BG1')
plt.fill_between(xs[292:], y1s[292:], y2s[292:],
                 where=y1s[292:] >= 2/3, color=color1,
                 label='_noLabel')
plt.fill_between(xs, y1s, where=xs <= 292, color=color2,
                 label='BG2')
plt.fill_between(xs, y0s, y2s, where=xs <= 3824,
                 color=color2, label='_noLabel')
plt.fill_between(xs, y0s, y3s, color=color2, label='_noLabel')
plt.tick_params(right=True, top=True, labelright=True,
                labeltop=True, rotation=0)
plt.tick_params(direction='inout')
plt.yticks([1/4, 2/3, 95/100])
plt.xticks([292, 3824, 8432])
# plt.grid(True, color='black', alpha=0.5, linestyle='solid')
plt.xlabel('Transport block size (TBS)')
plt.ylabel('Code Rate')
plt.text(6000, 2/3, 'BG1', fontsize=16)
plt.text(1500, 0.4, 'BG2', fontsize=16)
plt.legend(loc='lower right')
plt.tight_layout()
with PdfPages('figures/chp_theory/figureBG.pdf') as pdf:
    pdf.savefig(facecolor='w')
#  %%
