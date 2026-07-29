import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DerivativeFreeMethodsCanonicalLaneLean.ProblemFormulation

namespace HautevilleHouse
namespace DerivativeFreeMethodsCanonicalLaneLean

structure DirectSearchMethod where
  meshSize : Float
  pollSize : Nat
  expansionFactor : Float
  contractionFactor : Float
  convergenceCriterion : Prop

structure DirectSearchPackage (P : DerivativeFreeProblem) where
  method : DirectSearchMethod
  iterationCount : Nat
  meshUpdated : Prop
  pollSuccessful : Prop
  convergenceAchieved : Prop

structure DirectSearchEvidence {P : DerivativeFreeProblem}
    (D : DirectSearchPackage P) where
  meshUpdatedClosed : D.meshUpdated
  pollSuccessfulClosed : D.pollSuccessful
  convergenceAchievedClosed : D.convergenceAchieved

def DirectSearchClosed {P : DerivativeFreeProblem}
    (D : DirectSearchPackage P) : Prop :=
  D.meshUpdated ∧ D.pollSuccessful ∧ D.convergenceAchieved

theorem direct_search_closed_from_evidence {P : DerivativeFreeProblem}
    (D : DirectSearchPackage P) (E : DirectSearchEvidence D) :
    DirectSearchClosed D := by
  exact And.intro E.meshUpdatedClosed (And.intro E.pollSuccessfulClosed
    E.convergenceAchievedClosed)

end DerivativeFreeMethodsCanonicalLaneLean
end HautevilleHouse
