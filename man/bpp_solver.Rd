% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bpp_solver.r
\name{bpp_solver}
\alias{bpp_solver}
\title{bpp_solver}
\usage{
bpp_solver(it, bn)
}
\arguments{
\item{it}{it item <data.table>

 - oid: order id <integer>

 - sku: stock keeping unit as it id <character>

 - l: it length which scale will be placed along x-coordinate <numeric>

 - d: it depth  which scale will be placed along y-coordinate <numeric>

 - h: it height which scale will be placed along z-coordinate <numeric>

 - w: it weight optional which scale will be used restriction <integer>}

\item{bn}{bn bins <data.table>

 - id: bn id <character>

 - l: bn length limit along x-coordinate <numeric>

 - d: bn depth  limit along y-coordinate <numeric>

 - h: bn height limit along z-coordinate <numeric>

 - w: bn weight limit along w - a separate single dimension <numeric>

 - l, d, h will be sorted to have l >= d >= h within solver}
}
\value{
sn

 sn bpp_solution <list>

 - it item <data.table>

   - oid: order id <integer>

   - sku: stock keeping unit as it id <character>

   - tid: ticket id - an unique id within oid <integer>

   - otid: order id x ticket id - an unique indentifier indicate it with same tid can be packed into one bin <character>

   - bid: bn id <integer>

   - x, y, z it position in bid bin <numeric>

   - l, d, h it scale along x, y, z <numeric>

   - w it weight <numeric>

 - bn bins <data.table>

   - id bn id <character>

   - l bn length limit along x-coordinate <numeric>

   - d bn depth  limit along y-coordinate <numeric>

   - h bn height limit along z-coordinate <numeric>

   - w bn weight limit along w - a separate single dimension <numeric>
}
\description{
bpp single or multiple order packing solver
}
\details{
bpp solver is designed to solve packing in warehouse

 bpp solver digest input it as a list of order (oid) and each row contain one
  sku (sku) in an order with length (l), depth (d), height (h) and weight (w)
  and aims to pack it list into one or more bin from a given list of bin that
  bin length (l), depth (d), height (h), and a single weight limit (wlmt).

 bn list must be sorted by volume so that the smaller the eariler and preferred,
  and each bn must be sorted so that l >= d >= h

 bpp solver would call bpp_solver_dpp_wrapper and aims to find a packing schema
  such that: use as small number of bin as possible, and use small bin whenever
  possible, w.r.t the 3d none overlap constraint and weight limit constraint.
}
\note{
bpp_solver is an r-level wrapper over c-level bpp_solver_dpp_wrapper,
  add otid as an unique indentifier.
}

