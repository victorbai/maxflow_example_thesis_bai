# maxflow_example_thesis_bai
Matlab codes that illustrate an examples in Bai (2013)'s Ph.D Dessetation in Appendix A: AN EXAMPLE OF APPLICATION OF MAXFLOW METHOD IN MINING OPTIMIZATION
Dissertation link: 
https://publications.polymtl.ca/1168/1/2013_XiaoyuBai.pdf
Author: Xiaoyu (Victor) Bai
xiaoyu.bai@polymtl.ca

`@phdthesis{bai2013optimization,
  title={Optimization of underground stope with network flow method},
  author={Bai, Xiaoyu},
  year={2013},
  school={{\'E}cole Polytechnique de Montr{\'e}al}
}`

# What is the Example 

Use a 3x4 2D toy block model as data, build remove dependency arc structures, then call max flow function to get minimum cut result.  Finally convert it to max closure, which is equivilent of optimal pit in the model. 

# prerequest: matlab_bgl
http://dgleich.github.io/matlab-bgl/




