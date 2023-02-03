class-pool .
*"* class pool for class ZCL_RAP_PO_POC

*"* local type definitions
include ZCL_RAP_PO_POC================ccdef.

*"* class ZCL_RAP_PO_POC definition
*"* public declarations
  include ZCL_RAP_PO_POC================cu.
*"* protected declarations
  include ZCL_RAP_PO_POC================co.
*"* private declarations
  include ZCL_RAP_PO_POC================ci.
endclass. "ZCL_RAP_PO_POC definition

*"* macro definitions
include ZCL_RAP_PO_POC================ccmac.
*"* local class implementation
include ZCL_RAP_PO_POC================ccimp.

*"* test class
include ZCL_RAP_PO_POC================ccau.

class ZCL_RAP_PO_POC implementation.
*"* method's implementations
  include methods.
endclass. "ZCL_RAP_PO_POC implementation
