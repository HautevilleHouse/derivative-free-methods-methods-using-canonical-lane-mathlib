import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativeFreeMethodsMethodsUsingCanonicalLaneLean

structure ConvergenceMetricsPackage where
  bestFunctionValue : Float
  iterationCount : Nat
  gradientApproximationNorm : Float
  meshOrStepSize : Float
  stagnationFlag : Bool
  optimalityMeasure : Prop

structure ConvergenceMetricsEvidence (C : ConvergenceMetricsPackage) where
  bestFunctionValueClosed : C.bestFunctionValue < -1e10 ∨ C.bestFunctionValue > 1e-10
  iterationCountClosed : C.iterationCount > 0
  gradientApproximationNormClosed : C.gradientApproximationNorm ≥ 0.0
  meshOrStepSizeClosed : C.meshOrStepSize ≥ 0.0
  stagnationFlagClosed : C.stagnationFlag = false
  optimalityMeasureClosed : C.optimalityMeasure

def ConvergenceMetricsClosed (C : ConvergenceMetricsPackage) : Prop :=
  (C.bestFunctionValue < -1e10 ∨ C.bestFunctionValue > 1e-10) ∧
  C.iterationCount > 0 ∧
  C.gradientApproximationNorm ≥ 0.0 ∧
  C.meshOrStepSize ≥ 0.0 ∧
  C.stagnationFlag = false ∧
  C.optimalityMeasure

theorem convergence_metrics_closed_from_evidence (C : ConvergenceMetricsPackage) (E : ConvergenceMetricsEvidence C) :
    ConvergenceMetricsClosed C := by
  exact And.intro E.bestFunctionValueClosed
    (And.intro E.iterationCountClosed
      (And.intro E.gradientApproximationNormClosed
        (And.intro E.meshOrStepSizeClosed
          (And.intro E.stagnationFlagClosed E.optimalityMeasureClosed))))

end HautevilleHouse
end HautevilleHouse