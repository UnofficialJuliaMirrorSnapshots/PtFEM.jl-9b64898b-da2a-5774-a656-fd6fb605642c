using PtFEM, Test

data = Dict(
  # GenericSolid(ndim, nst, nels, nn, nip, finite_element(nod, nodof), axisymmentrix)
  :struc_el => GenericSolid(3, 6, 6, 8, 1, Tetrahedron(4, 3), false),
  :properties => [100.0 0.3 0.0;],
  :g_coord => [
    0.0 0.0 0.0; 1.0 0.0 0.0; 0.0 0.0 -1.0; 1.0 0.0 -1.0;
    0.0 1.0 0.0; 1.0 1.0 0.0; 0.0 1.0 -1.0; 1.0 1.0 -1.0],
  :g_num => [
    1, 3, 4, 7,
    1, 4, 2, 7,
    1, 2, 5, 7,
    6, 4, 8, 7,
    6, 2, 4, 7,
    6, 5, 2, 7
  ],
  :support => [
    (1, [0 0 1]), (2, [1 0 1]), (3, [0 0 0]), (4, [1 0 0]),
    (5, [0 1 1]), (7, [0 1 0]), (8, [1 1 0])
  ],
  :loaded_nodes => [
    ( 1, [0.0 0.0 -1/6]),
    ( 2, [0.0 0.0 -1/3]),
    ( 5, [0.0 0.0 -1/3]),
    ( 6, [0.0 0.0 -1/6])
  ]
)

@time m, dis_df, fm_df = p54(data)

@test m.loads[0:12] ≈ [0.0,-0.010000000000000004,0.003000000000000002,
  -0.010000000000000004,0.003000000000000001,0.003000000000000001,
  -0.010000000000000004,0.0030000000000000014,0.0030000000000000014,
  -0.010000000000000004,0.003000000000000001,0.0030000000000000022,
  0.003000000000000002]