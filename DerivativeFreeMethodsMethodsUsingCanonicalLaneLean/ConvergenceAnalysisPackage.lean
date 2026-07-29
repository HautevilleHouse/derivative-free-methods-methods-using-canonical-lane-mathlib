import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativeFreeMethodsMethodsUsingCanonicalLaneLean

structure ConvergenceAnalysisPackage where
  worstCaseComplexity : Prop
  probabilisticConvergence : Prop
  oracleLowerBound : Prop
  adaptivityGain : Prop

structure ConvergenceAnalysisEvidence (C : ConvergenceAnalysisPackage) where
  worstCaseComplexityClosed : C.worstCaseComplexity
  probabilisticConvergenceClosed : C.probabilisticConvergence
  oracleLowerBoundClosed : C.oracleLowerBound
  adaptivityGainClosed : C.adaptivityGain

def ConvergenceAnalysisClosed (C : ConvergenceAnalysisPackage) : Prop :=
  C.worstCaseComplexity ∧ C.probabilisticConvergence ∧
  C.oracleLowerBound ∧ C.adaptivityGain

theorem convergence_analysis_closed_from_evidence (C : ConvergenceAnalysisPackage)
    (E : ConvergenceAnalysisEvidence C) : ConvergenceAnalysisClosed C := by
  exact And.intro E.worstCaseComplexityClosed
    (And.intro E.probabilisticConvergenceClosed
      (And.intro E.oracleLowerBoundClosed E.adaptivityGainClosed))

end DerivativeFreeMethodsMethodsUsingCanonicalLaneLean
end HautevilleHouse
