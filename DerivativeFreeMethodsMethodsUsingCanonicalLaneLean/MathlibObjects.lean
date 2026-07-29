import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativeFreeMethodsCanonicalLaneLean

structure AdmittedObject where
  space : Type
  topology : TopologicalSpace space
  problemDefined : Prop
  solutionExists : Prop
  conclusion : solutionExists

structure EndgameState where
  object : AdmittedObject

def witnessClosed (O : AdmittedObject) : Prop :=
  O.solutionExists

end DerivativeFreeMethodsCanonicalLaneLean
end HautevilleHouse
