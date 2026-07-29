import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativeFreeMethodsMethodsUsingCanonicalLaneLean

structure DomainKnowledgePackage where
  constraintSetAdmissible : Prop
  distributionAssumptions : Prop
  oracleBudget : Prop
  convergenceCondition : Prop

structure DomainKnowledgeEvidence (D : DomainKnowledgePackage) where
  constraintSetAdmissibleClosed : D.constraintSetAdmissible
  distributionAssumptionsClosed : D.distributionAssumptions
  oracleBudgetClosed : D.oracleBudget
  convergenceConditionClosed : D.convergenceCondition

def DomainKnowledgeClosed (D : DomainKnowledgePackage) : Prop :=
  D.constraintSetAdmissible ∧ D.distributionAssumptions ∧
  D.oracleBudget ∧ D.convergenceCondition

theorem domain_knowledge_closed_from_evidence (D : DomainKnowledgePackage)
    (E : DomainKnowledgeEvidence D) : DomainKnowledgeClosed D := by
  exact And.intro E.constraintSetAdmissibleClosed
    (And.intro E.distributionAssumptionsClosed
      (And.intro E.oracleBudgetClosed E.convergenceConditionClosed))

end DerivativeFreeMethodsMethodsUsingCanonicalLaneLean
end HautevilleHouse
