import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativeFreeMethodsMethodsUsingCanonicalLaneLean

structure DirectSearchMethodsPackage where
  patternSet : Type u
  pollStep : Type v
  searchStep : Type w
  convergenceTheory : Prop
  meshAdaptation : Prop
  pollCondition : Prop

structure DirectSearchMethodsEvidence (D : DirectSearchMethodsPackage) where
  convergenceTheoryClosed : D.convergenceTheory
  meshAdaptationClosed : D.meshAdaptation
  pollConditionClosed : D.pollCondition

def DirectSearchMethodsClosed (D : DirectSearchMethodsPackage) : Prop :=
  D.convergenceTheory ∧ D.meshAdaptation ∧ D.pollCondition

theorem direct_search_methods_closed_from_evidence
    (D : DirectSearchMethodsPackage) (E : DirectSearchMethodsEvidence D) :
    DirectSearchMethodsClosed D := by
  exact And.intro E.convergenceTheoryClosed
    (And.intro E.meshAdaptationClosed E.pollConditionClosed)

end DerivativeFreeMethodsMethodsUsingCanonicalLaneLean
end HautevilleHouse