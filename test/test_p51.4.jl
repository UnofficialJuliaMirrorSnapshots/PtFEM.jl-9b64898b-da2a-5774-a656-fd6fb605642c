using PtFEM, Test

data = Dict(
  # Plane(ndim, nst, nxe, nye, nip, direction, finite_element(nod, nodof), axisymmetric)
  :struc_el => Plane(2, 3, 3, 2, 4, :x, Quadrilateral(8, 2), false),
  :properties => [1.0e6 0.3;],
  :x_coords => [0.0, 3.0, 6.0],
  :y_coords => [0.0, -3.0, -6.0, -9.0],
  :support => [
    ( 1, [0 1]),
    ( 6, [0 1]),
    ( 9, [0 1]),
    (14, [0 1]),
    (17, [0 1]),
    (22, [0 1]),
    (25, [0 0]),
    (26, [0 0]),
    (27, [0 0]),
    (28, [0 0]),
    ( 5, [0 1]),
    ( 8, [0 1]),
    (13, [0 1]),
    (16, [0 1]),
    (21, [0 1]),
    (24, [0 1]),
    (29, [0 0])
    ],
  :loaded_nodes => [
    (1, [0.0 -0.5]),
    (2, [0.0 -2.0]),
    (3, [0.0 -0.5])
    ]
)

@time m, dis_df, fm_df = p51(data);

@test m.loads[0:36] ≈ [0.0,-5.310672021656476e-6,-4.211153422117119e-7,
  -5.04123153829146e-6,-7.221882550664876e-7,-3.3428571428571473e-6,
  -4.211153422117125e-7,-1.6444827474228391e-6,-1.3750422640578195e-6,
  -4.288483723850779e-6,3.774202388609178e-7,-2.7857142857142914e-6,
  -1.2829448475778024e-6,-3.2431230529276257e-6,2.7081477113201545e-7,
  -2.8731660139934707e-6,3.6699957275470236e-7,-2.2285714285714337e-6,
  2.708147711320155e-7,-1.5839768431493952e-6,-1.2140198042152427e-6,
  -2.217378390101892e-6,2.996313701739242e-7,-1.6714285714285747e-6,
  -1.125478752755258e-6,-1.3787735959184822e-6,1.3704853665438675e-7,
  -1.298707004971293e-6,1.912334941440869e-7,-1.1142857142857151e-6,
  1.3704853665438667e-7,-9.298644236001403e-7,-8.497978326529501e-7,
  -6.453529188458675e-7,1.1219944448620244e-7,-5.571428571428575e-7,
  -4.68932795439848e-7]