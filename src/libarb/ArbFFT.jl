abstract type AbstractArbVector{P, T}  <: AbstractVector{T} end

export DFT, InverseDFT

function DFT(x::Array{ArbComplex{P},1}) where {P}
    length = size(x)[1]
    transf = zeros(ArbComplex{P},length)
    # we call the acb_dft void acb_dft(acb_ptr w, acb_srcptr v, slong n, slong prec)
    ccall(@libarb(acb_dft), Cvoid, (Ref{ArbComplex{P}}, Ref{ArbComplex{P}}, Cint, Cint ), transf, x, length, P)
    return transf
end

function InverseDFT(x::Array{ArbComplex{P},1}) where {P}
    length = size(x)[1]
    transf = zeros(ArbComplex{P},length)
    # we call the acb_dft void acb_dft_inverse(acb_ptr w, acb_srcptr v, slong n, slong prec)
    ccall(@libarb(acb_dft_inverse), Cvoid, (Ref{ArbComplex{P}}, Ref{ArbComplex{P}}, Cint, Cint ), transf, x, length, P)
    return transf
end

