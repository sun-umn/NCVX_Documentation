Deep Learning with Nontrivial Constraints
================================================

**Buyun Liang, Ryan de Vera, Tim Mitchell, and Ju Sun @SDM 23 Tutorial**

Abstract
--------------------------------
This tutorial focuses on practical ways to handle constraints in deep learning and its applications. We will start with constraints that can be absorbed into deep neural networks, then move to simple constraints that allow projected-gradient style algorithms. For nontrivial constraints, we will discuss standard numerical methods such as penalty methods and augmented Lagrangian methods. Our tutorial will culminate with the introduction of NCVX, a general-purpose optimization package we have built to solve generic constrained deep learning problems. We will draw concrete examples from various scientific and engineering domains such as computer vision, structure design, physicsaware machine learning, and imbalanced learning, to help the audience to understand and apply these practical numerical methods.

More details can be found in the `SDM23 proposal <_files/2023_SDM_PyGRANSO_Tutorial.pdf>`_ and `SDM23 tutorial slides <_files/SDM23_Deep_Learning_with_Nontrivial_Constraints.pdf>`_.

Tutorial Structure
---------------------------------

We will introduce both scientific and engineering applications leading to constrained deep learning problems with nontrivial constraints, and practical numerical methods to solve them. We will start with the background and motivation of deep learning with nontrivial constraints, followed by the current challenges about solving this type of problems. Next, we will introduce the recent works in constrained deep learning, which is necessary in robust vision recognition and AI for science, but is not easy to solve. After that, we will focus on a general-purpose software package targeted at constrained deep learning. Last, we
will discuss some open problems and the future directions to go.

**Background and Motivation (20 min)**

* Motivating examples: Robustness in vision recognition, AI for science (10 min)
* Challenges: Reliably solving them requires optimization expertise (10 min)

**Concrete Examples of Constrained Deep Learning & Tailored Numerical Methods for Solving Them (40 min)**
    
* Robustness in vision recognition (10 min)
* Knowledge-aware machine learning (10 min)
* Neural structural optimization (10 min)
* Orthogonal recurrent neural networks (10 min)

**Break (5 min)**

**NCVX: A General-Purpose Software Package for Constrained Deep Learning (50 min)**

* Algorithms of NCVX (15 min)
* Constrained DL examples in NCVX (15 min)
* Practical tricks to speed up convergence (20 min)

**Open Problems and Frontiers (10 min)**

* Challenges (5 min)
* Future work (5 min)

Presenters
-----------------

.. list-table::

    *   - .. figure:: buyunliang.jpg
            :width: 200px
            :height: 200px

            `Buyun Liang <https://buyunliang.org/>`_

            University of Minnesota, Twin Cities

        - .. figure:: Ryan.png
            :width: 200px
            :height: 200px

            `Ryan de Vera <https://github.com/rydevera3>`_

            University of Minnesota, Twin Cities


    *   - .. figure:: tim.jpg
            :width: 200px
            :height: 200px

            `Tim Mitchell <http://www.timmitchell.com/>`_
            
            Assistant Professor
            
            Queens College, City University of New York


        - .. figure:: sunju_2016.jpg
            :height: 200px

            `Ju Sun <https://sunju.org/>`_

            Assistant Professor

            University of Minnesota, Twin Cities
    

.. .. figure:: sunju_2016.jpg
..     :scale: 80 %
.. ..    :width: 200px
.. ..    :height: 100px
..    :scale: 100 %
.. ..    :alt: alternate text
.. ..    :align: left



.. .. raw:: html

..     <a  href="https://github.com/sun-umn/NCVX"><img alt="" src="../_images/NCVX_logo.png" style="width: 300px;" /></a>
    
..     <a  href="https://github.com/sun-umn/NCVX"><img alt="" src="../_images/NCVX_logo.png" style="width: 300px;" /><figcaption>Fig.1 - Trulli, Puglia, Italy.</figcaption></a></a><br> <br> 
    
..     <a  href="https://github.com/sun-umn/NCVX"><img alt="" src="../_images/NCVX_logo.png" style="width: 300px;" /></a>
    
..     <a  href="https://github.com/sun-umn/NCVX"><img alt="" src="../_images/NCVX_logo.png" style="width: 300px;" /></a><br> <br> 
