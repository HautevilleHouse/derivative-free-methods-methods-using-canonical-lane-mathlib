import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativeFreeMethodsCanonicalLaneLean

structure ObjectiveFunction where
  domain : Type
  codomain : Type
  f : domain → codomain
  blackbox : Bool

structure DerivativeFreeProblem where
  objective : ObjectiveFunction
  dimension : Nat
  boundConstraints : Prop
  feasibleSet : Prop
  terminationCondition : Prop

structure DerivativeFreeProblemEvidence (P : DerivativeFreeProblem) where
  objectiveDefined : P.objective.f ≠ λ _ => undefined
  dimensionFinite : P.dimension ≥ 0
  boundConstraintsClosed : P.boundConstraints
  feasibleSetClosed : P.feasibleSet
  terminationConditionClosed : P.terminationCondition

def DerivativeFreeProblemClosed (P : DerivativeFreeProblem) : Prop :=
  (P.objective.f ≠ λ _ => undefined) ∧
  P.boundConstraints ∧
  P.feasibleSet ∧
  P.terminationCondition

theorem derivative_free_problem_closed_from_evidence (P : DerivativeFreeProblem)
    (E : DerivativeFreeProblemEvidence P) : DerivativeFreeProblemClosed P := by
  exact And.intro E.objectiveDefined (And.intro E.boundConstraintsClosed
    (And.intro E.feasibleSetClosed E.terminationConditionClosed))

end DerivativeFreeMethodsCanonicalLaneLean
end HautevilleHouse
