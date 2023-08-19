# Anaconda, Python <img src='https://cdn3.iconfinder.com/data/icons/logos-and-brands-adobe/512/267_Python-512.png' width="22">

> Always see the documentation page for installation commands

`-c` flag is for the **channel** from which package is to be installed (For example, anaconda, conda-forge, pytorch)

---

## Launching Jupyter 🪐

1. Open terminal in current folder
1. Switch to or Create required conda environment: `conda activate devenv`
1. Start `jupyter notebook`

_**OR**_

1. Open Anconda Navigator
1. Change environment
1. Launch Jupyter (install first if not already installed in environment)

---

### **Update Conda: ⬆️**

`conda update conda`

### **Update All Packages: ⬆️**

`conda update --all`

### **Update Anaconda Navigator: ⬆️**

Get out of current environment: `conda deactivate`

`conda update anaconda-navigator`

---

### List or Search Packages 🔍

`conda list | grep -i urllib`

---

### Check Environments

`conda env list`

```bash
# conda environments:
#
base                  *  /home/kumar/anaconda3
mypipenv_tf              /home/kumar/anaconda3/envs/mypipenv_tf
r-essentials             /home/kumar/anaconda3/envs/r-essentials
r_env                    /home/kumar/anaconda3/envs/r_env
```

### Create New Environment

`conda install -c anaconda tensorflow myenv`

### Create an environment with a specific package

`conda create -n myenv scipy`

Extra options: `conda create -n myenv python=3.9 scipy=0.17.3 astroid babel`

### Create new Clone Environment

`conda create -n myclone --clone myenv`

### Switch/Load Environment

`conda activate mypipenv_tf`

### Delete Environment

First `conda deactivate`

`conda env remove -n corrupted_env`

---

### Install packages INSIDE Jupyter Notebook

Check [here for more info](https://jakevdp.github.io/blog/2017/12/05/installing-python-packages-from-jupyter/)

```jupyter
    import sys
    !conda install --yes --prefix {sys.prefix} pytorch torchvision torchaudio cpuonly -c pytorch
```

`!conda install pytorch torchvision torchaudio cpuonly -c pytorch`

`!pip install <package_name>`

`%conda install <package_name>`

---

## Remove Anaconda Completely

[Python Anaconda - How to Safely Uninstall](https://stackoverflow.com/questions/22585235/python-anaconda-how-to-safely-uninstall)

[Installing conda-clean](https://anaconda.org/anaconda/anaconda-clean)

```shell
> conda install -c anaconda anaconda-clean

> conda activate base

> anaconda-clean --yes
Backup directory: /home/kumar/.anaconda_backup/2023-02-15T114707

> sudo rm -rf ~/anaconda3

> sudo rm -rf ~/.anaconda_backup

> zshconfig
# Remove conda setup from PATH that was set by 'conda init'

> source ~/.zshrc
```

---

## Linux <img src='https://cdn-icons-png.flaticon.com/512/6124/6124995.png' width="17">

Follow the [instructions on the official page](https://docs.anaconda.com/anaconda/install/linux/)

Installation location `PREFIX=/home/kumar/anaconda3`

(base) environment location: `/home/kumar/anaconda3`

To avoid conda activating “**base”** env. on startup `conda config --set auto_activate_base false`

```bash
# The base environment is activated by default
conda config --set auto_activate_base True

# The base environment is not activated by default
conda config --set auto_activate_base False

# The above commands only work if conda init has been run first
# conda init is available in conda versions 4.6.12 and later
```

---

**ZSH**

Current conda environment to display or not option located in file `~/.p10k.zsh`

---

## Windows <img src='https://seeklogo.com/images/W/windows-11-icon-logo-6C39629E45-seeklogo.com.png' width="17">

1. Download [Anaconda Distribution](https://www.anaconda.com/products/distribution) (.exe) installer. Install for **current User** only.
2. Do **NOT** Select **_Add to PATH_** option.
3. After Installation, open Anaconda Prompt from Start Menu. Locate `where conda` and `where python` (.exe) files and add it to **User’s PATH**
4. Create _`devenv`_ environment initialized with [`tensorflow`](https://docs.anaconda.com/anaconda/user-guide/tasks/tensorflow/)

```bash
conda create -n devenv tensorflow
conda activate devenv
```

Install packages: [`jupyter`](https://anaconda.org/anaconda/jupyter) , [`keras`](https://anaconda.org/anaconda/keras) , [`theano`](https://anaconda.org/anaconda/theano) , [`pytorch`](https://pytorch.org)

`conda install pytorch torchvision torchaudio cpuonly -c pytorch`

Jupyter Notebook **[Extensions](https://docs.continuum.io/anaconda/user-guide/tasks/use-jupyter-notebook-extensions/#obtaining-the-extensions)**

---

**Convert `.ipynb` to `html` :** [Jupyter Notebooks(ipynb) Viewer and Converter](https://htmtopdf.herokuapp.com/ipynbviewer/)

**Convert `html` to `PDF` :** [html2pdf](https://html2pdf.com/)

---
