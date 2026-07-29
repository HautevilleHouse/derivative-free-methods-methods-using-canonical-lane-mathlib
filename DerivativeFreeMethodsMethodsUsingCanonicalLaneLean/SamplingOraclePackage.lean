import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativeFreeMethodsMethodsUsingCanonicalLaneLean

structure SamplingOraclePackage where
  samplingBudget : Nat
  noiseModel : Prop
  queryAdaptivity : Prop
  estimationError : Prop

structure SamplingOracleEvidence (S : SamplingOraclePackage) where
  samplingBudgetClosed : S.samplingBudget > 0
  noiseModelClosed : S.noiseModel
  queryAdaptivityClosed : S.queryAdaptivity
  estimationErrorClosed : S.estimationError

def SamplingOracleClosed (S : SamplingOraclePackage) : Prop :=
  S.samplingBudget > 0 ∧ S.noiseModel ∧ S.queryAdaptivity ∧ S.estimationError

theorem sampling_oracle_closed_from_evidence (S : SamplingOraclePackage)
    (E : SamplingOracleEvidence S) : SamplingOracleClosed S := by
  exact And.intro E.samplingBudgetClosed
    (And.intro E.noiseModelClosed
      (And.intro E.queryAdaptivityClosed E.estimationErrorClosed))

end DerivativeFreeMethodsMethodsUsingCanonicalLaneLean
end HautevilleHouse
