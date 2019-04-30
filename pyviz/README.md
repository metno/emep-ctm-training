# Data Visualization in Python

We'll use the [PyViz][] meta-package from [Conda][]
to visualize our data on a [Jupyter][] notebook.

[PyViz]: http://pyviz.org
[Conda]: https://conda.io
[Jupyter]: http://jupyter.org

## Environment in nebula

### conda environment

```bash
# load the anaconda module
module load  Python/3.7.0-anaconda-5.3.0-extras-nsc1

# create a new environmnet
conda create -n pyviz python=3.6

# activate the new environment
source activate pyviz

# install the packages
conda install -c pyviz/label/dev pyviz
conda install -c conda-forge jupyterlab
conda install -c conda-forge nodejs
jupyter labextension install @pyviz/jupyterlab_pyviz
```

### Jupyter from nebula

```bash
# load the anaconda module
module load  Python/3.7.0-anaconda-5.3.0-extras-nsc1

# activate the new environment
source activate pyviz

# start jupyter lab
jupyter lab --no-browser
```

Pay attention to the messages from `jupyter`.
Look for a line like

```file
http://localhost:8888/?token=4207d218e520a34ded46c6be419bd23bb3e05cb973dcfdaa
```

Take notice of the number after `localhost`.
We'll assume is `8888`, but it might be different.

### On your local machine

```bash
# from your local machine
ssh YOUR_HPC_USERNAME@nebula.nsc.liu.se -L8888:127.0.0.1:8888
```

Here the `8888` is the port number from the prevous exercise.
Now open `localhost:8888/?token=...` on your web-browser, e.g.

```bash
google-chrome http://localhost:8888/?token=4207d218e520a34ded46c6be419bd23bb3e05cb973dcfdaa 
```

Note that the token will be different.