Analysis Workflows
==================

BasalCellDemo demonstrates a heterogeneous bioinformatics workflow in which
Python- and R-based analyses are managed within a single project environment.

Preprocessing and Automated Annotation with Python
--------------------------------------------------

.. nbgallery::

    jupyternb/01_preprocessing_with_python


Manual Annotation and Label Visualization with R
-------------------------------------------------

.. nbgallery::

    jupyternb/02_analysis_with_r


Cross-infrastructure Workspace Portability
==========================================

The following notebooks demonstrate reconstruction and execution of the same
BasalCellDemo workflow on two independent Linux computing infrastructures.
The project was transferred through Git and reconstructed from the same
project specification, including both Python and R analysis environments.

acrest-gpu1
-----------

Python workflow
~~~~~~~~~~~~~~~

.. nbgallery::

    jupyternb/01_preprocessing_with_python_acrest-gpu1

R workflow
~~~~~~~~~~

.. nbgallery::

    jupyternb/02_analysis_with_r_acrest-gpu1


SHIROKANE (hww04)
-----------------

Python workflow
~~~~~~~~~~~~~~~

.. nbgallery::

    jupyternb/01_preprocessing_with_python_hww04

R workflow
~~~~~~~~~~

.. nbgallery::

    jupyternb/02_analysis_with_r_hww04


Limits of Environment Reconstruction
====================================

Reconstructing a software environment does not necessarily guarantee
numerically identical analytical outputs across computing hosts. The
following notebooks apply the same GBM single-cell RNA-seq workflow to
GSE223065 after reconstructing the BasalCellDemo environment on each
infrastructure.

acrest-gpu1
-----------

.. nbgallery::

    jupyternb/03_gse223065_acrest-gpu1


SHIROKANE (hww04)
-----------------

.. nbgallery::

    jupyternb/03_gse223065_hww04
