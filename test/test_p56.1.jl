using PtFEM, Test

data = Dict(
  # Solid(ndim, nst, nxe, nye, nze, nip, direction=:r, finite_element(nod, nodof))
  :struc_el => Solid(3, 6, 1, 3, 2, 8, Hexahedron(20, 3)),
  :properties => [
    100.0 0.3;
     50.0 0.3
     ],
  :etype => [1, 2, 1, 2, 1, 2],
  :x_coords => [0.0, 0.5],
  :y_coords => [0.0, 1.0, 2.0, 3.0],
  :z_coords => [0.0, -1.0, -2.0],
  :support => [
    ( 1, [0 0 1]), ( 2, [1 0 1]), ( 3, [1 0 1]), ( 4, [0 0 1]), ( 5, [1 0 1]), ( 6, [0 0 1]),
    ( 7, [1 0 1]), ( 8, [1 0 1]), ( 9, [0 0 1]), (10, [1 0 1]), (11, [0 0 0]), (12, [0 0 0]),
    (13, [0 0 0]), (14, [0 1 1]), (16, [0 1 1]), (18, [0 0 0]), (19, [0 0 0]), (20, [0 1 1]),
    (23, [0 1 1]), (25, [0 1 1]), (28, [0 1 1]), (30, [0 0 0]), (31, [0 0 0]), (32, [0 0 0]),
    (33, [0 1 1]), (35, [0 1 1]), (37, [0 0 0]), (38, [0 0 0]), (39, [0 1 1]), (42, [0 1 1]),
    (44, [0 1 1]), (47, [0 1 1]), (49, [0 0 0]), (50, [0 0 0]), (51, [0 0 0]), (52, [0 1 1]),
    (54, [0 1 1]), (56, [0 0 0]), (57, [0 0 0]), (58, [0 1 1]), (61, [0 1 1]), (63, [0 1 1]),
    (66, [0 1 1]), (68, [0 0 0]), (69, [0 0 0]), (70, [0 0 0])
    ],
  :loaded_nodes => [
    ( 1, [0.0 0.0  0.0417]), ( 2, [0.0 0.0 -0.1667]), ( 3, [0.0 0.0 0.0417]),
    (14, [0.0 0.0 -0.1667]), (15, [0.0 0.0 -0.1667]), (20, [0.0 0.0 0.0417]),
    (21, [0.0 0.0 -0.1667]), (22, [0.0 0.0  0.0417])
    ],
  :cg_tol => 1.0e-6,
  :cg_limit => 200
)

@time dis_df, sigma_df = p56(data)

@test  round.(convert(Array, sigma_df[end, 4:end]), digits=4) ≈ 
  round.([0.00740581  -0.0438989  -0.0283135  -0.000564003  0.060832  5.09367e-5], digits=4)