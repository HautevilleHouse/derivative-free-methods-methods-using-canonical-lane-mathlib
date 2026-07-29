import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativeFreeMethodsMethodsUsingCanonicalLaneLean

/-- A structure representing a derivative-free optimization method. -/
structure DFOptimizationMethod where
  algorithm : String
  objectiveFunction : Type u
  initialPoint : objectiveFunction -> Type v
  iterationSequence : Type w
  convergenceClaim : Prop

/-- A certificate that the method satisfies the admissible class bridge. -/
structure DFOptimizationEvidence (A : AdmissibleClass) (M : DFOptimizationMethod) where
  convergenceClosed : M.convergenceClaim
  bridgeClosed : bridgeClosed A
  gateClosed : gateClosed A

/-- The closure condition for a derivative-free optimization method. -/
def DFOptimizationClosure (A : AdmissibleClass) (M : DFOptimizationMethod) : Prop :=
  M.convergenceClaim ∧ bridgeClosed A ∧ gateClosed A

/-- The closure from evidence. -/
theorem df_optimization_closed_from_evidence (A : AdmissibleClass) (M : DFOptimizationMethod)
    (E : DFOptimizationEvidence A M) : DFOptimizationClosure A M :=
  And.intro E.convergenceClosed (And.intro E.bridgeClosed E.gateClosed)

end DerivativeFreeMethodsMethodsUsingCanonicalLaneLean
end HautevilleHouse