import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativeFreeMethodsMethodsUsingCanonicalLaneLean

def ConstrainedDFMClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_dfm_endgame (A : AdmissibleClass) :
    ConstrainedDFMClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DerivativeFreeMethodsMethodsUsingCanonicalLaneLean
end HautevilleHouse