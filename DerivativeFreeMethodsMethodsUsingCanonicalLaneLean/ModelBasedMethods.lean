import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativeFreeMethodsMethodsUsingCanonicalLaneLean

structure ModelBasedMethodsPackage where
  surrogateModel : Type u
  trustRegion : Type v
  modelUpdateRule : Type w
  globalConvergence : Prop
  localConvergenceRate : Prop
  modelFidelity : Prop

structure ModelBasedMethodsEvidence (M : ModelBasedMethodsPackage) where
  globalConvergenceClosed : M.globalConvergence
  localConvergenceRateClosed : M.localConvergenceRate
  modelFidelityClosed : M.modelFidelity

def ModelBasedMethodsClosed (M : ModelBasedMethodsPackage) : Prop :=
  M.globalConvergence ∧ M.localConvergenceRate ∧ M.modelFidelity

theorem model_based_methods_closed_from_evidence
    (M : ModelBasedMethodsPackage) (E : ModelBasedMethodsEvidence M) :
    ModelBasedMethodsClosed M := by
  exact And.intro E.globalConvergenceClosed
    (And.intro E.localConvergenceRateClosed E.modelFidelityClosed)

end DerivativeFreeMethodsMethodsUsingCanonicalLaneLean
end HautevilleHouse