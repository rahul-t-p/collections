### A Pluto.jl notebook ###
# v0.19.12

using Markdown
using InteractiveUtils

# ╔═╡ 222a74df-9f7e-46b7-814c-e539b0b02592
md"""
# MaxPool2D
"""

# ╔═╡ bc54cdfe-7576-4ee9-b621-f15cc9ea90f4
md"""
#### Manual Implementation
"""

# ╔═╡ f57f94a0-3809-4686-869a-ea64feed5807
function MaxPool2D(X::Matrix,
					kernel_size::Int=2,
					stride::Int=1,
					padding::Int=0)::Matrix{Float32}
	out_size = Int.((size(X, 1) + 2*padding - kernel_size) / stride) + 1
	X_OUT = zeros((out_size, out_size))

	for out_row in 1:out_size
		for out_col in 1:out_size
			max_val = -Inf
			row_start = (out_row-1) * stride + 1
			row_end = row_start + kernel_size - 1
			col_start = (out_col-1) * stride + 1
			col_end = col_start + kernel_size - 1
			for in_row in row_start:row_end
				for in_col in col_start:col_end
					if X[in_row, in_col] > max_val
						max_val = X[in_row, in_col]
					end
				end
			end
			X_OUT[out_row, out_col] = max_val
		end	
	end
	
	return X_OUT
end

# ╔═╡ c7c5a9a1-6afb-45ec-8675-077c117a899d
IN = [[10 15 1 2]
	 [7 9 2 0]
	 [3 2 15 8]
	 [5 0 1 7]]

# ╔═╡ cfa291b8-31d2-4ab9-9654-01d6f299e1d3
MaxPool2D(IN, 2, 1)

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.7.3"
manifest_format = "2.0"

[deps]
"""

# ╔═╡ Cell order:
# ╟─222a74df-9f7e-46b7-814c-e539b0b02592
# ╟─bc54cdfe-7576-4ee9-b621-f15cc9ea90f4
# ╠═f57f94a0-3809-4686-869a-ea64feed5807
# ╠═c7c5a9a1-6afb-45ec-8675-077c117a899d
# ╠═cfa291b8-31d2-4ab9-9654-01d6f299e1d3
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
