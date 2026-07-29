import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativeFreeMethodsMethodsUsingCanonicalLaneLean

structure StochasticApproximationPackage where
  objectiveFunction : Type u
  gradientEstimate : Type v
  stepSizeSequence : Type w
  iterateSequence : Type z
  convergenceInProbability : Prop
  almostSureConvergence : Prop
  convergenceRate : Prop

structure StochasticApproximationEvidence (S : StochasticApproximationPackage) where
  convergenceInProbabilityClosed : S.convergenceInProbability
  almostSureConvergenceClosed : S.almostSureConvergence
  convergenceRateClosed : S.convergenceRate

def StochasticApproximationClosed (S : StochasticApproximationPackage) : Prop :=
  S.convergenceInProbability ∧ S.almostSureConvergence ∧ S.convergenceRate

theorem stochastic_approximation_closed_from_evidence
    (S : StochasticApproximationPackage) (E : StochasticApproximationEvidence S) :
    StochasticApproximationClosed S := by
  exact And.intro E.convergenceInProbabilityClosed
    (And.intro E.almostSureConvergenceClosed E.convergenceRateClosed)

end DerivativeFreeMethodsMethodsUsingCanonicalLaneLean
end HautevilleHouse