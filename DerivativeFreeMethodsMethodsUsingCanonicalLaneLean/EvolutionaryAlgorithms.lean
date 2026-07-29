import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativeFreeMethodsMethodsUsingCanonicalLaneLean

structure EvolutionaryAlgorithmsPackage where
  population : Type u
  selectionOperator : Type v
  crossoverOperator : Type w
  mutationOperator : Type x
  convergenceTheory : Prop
  diversityMaintenance : Prop
  convergenceRate : Prop

structure EvolutionaryAlgorithmsEvidence (E : EvolutionaryAlgorithmsPackage) where
  convergenceTheoryClosed : E.convergenceTheory
  diversityMaintenanceClosed : E.diversityMaintenance
  convergenceRateClosed : E.convergenceRate

def EvolutionaryAlgorithmsClosed (E : EvolutionaryAlgorithmsPackage) : Prop :=
  E.convergenceTheory ∧ E.diversityMaintenance ∧ E.convergenceRate

theorem evolutionary_algorithms_closed_from_evidence
    (E : EvolutionaryAlgorithmsPackage) (Ev : EvolutionaryAlgorithmsEvidence E) :
    EvolutionaryAlgorithmsClosed E := by
  exact And.intro Ev.convergenceTheoryClosed
    (And.intro Ev.diversityMaintenanceClosed Ev.convergenceRateClosed)

end DerivativeFreeMethodsMethodsUsingCanonicalLaneLean
end HautevilleHouse