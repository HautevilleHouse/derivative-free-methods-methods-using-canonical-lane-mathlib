import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativeFreeMethodsMethodsUsingCanonicalLaneLean

structure SurrogateAssistedOptimizationPackage where
  surrogateModel : Type u
  infillCriterion : Type v
  modelManagement : Type w
  globalConvergence : Prop
  localConvergenceRate : Prop
  expectedImprovement : Prop

structure SurrogateAssistedOptimizationEvidence (S : SurrogateAssistedOptimizationPackage) where
  globalConvergenceClosed : S.globalConvergence
  localConvergenceRateClosed : S.localConvergenceRate
  expectedImprovementClosed : S.expectedImprovement

def SurrogateAssistedOptimizationClosed (S : SurrogateAssistedOptimizationPackage) : Prop :=
  S.globalConvergence ∧ S.localConvergenceRate ∧ S.expectedImprovement

theorem surrogate_assisted_optimization_closed_from_evidence
    (S : SurrogateAssistedOptimizationPackage) (E : SurrogateAssistedOptimizationEvidence S) :
    SurrogateAssistedOptimizationClosed S := by
  exact And.intro E.globalConvergenceClosed
    (And.intro E.localConvergenceRateClosed E.expectedImprovementClosed)

end DerivativeFreeMethodsMethodsUsingCanonicalLaneLean
end HautevilleHouse