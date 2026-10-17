# Drafted with ALDashboard story_from_docassemble_yaml, then reviewed against care_type_finder.yml.
@care_type
Feature: Massachusetts care type recommendations

  Scenario: Caregiver when the child lives with an eligible helper
    Given the maximum seconds for each step is 60
    And I start the interview at "care_type_finder.yml"
    And I get to the question id "care type recommendation" with this data:
      | var | value |
      | phase0_ack | True |
      | is_parent | False |
      | child_abuse | False |
      | helper_location | False |
      | helper_age | False |
      | user_saw_helper_eligible | True |
      | help_needed | True |
      | child_home | True |
      | parent_decision | False |
    Then I should see the phrase "Based on your answer choices, consider a Caregiver."

  Scenario: Temporary agent when the child lives elsewhere
    Given the maximum seconds for each step is 60
    And I start the interview at "care_type_finder.yml"
    And I get to the question id "care type recommendation" with this data:
      | var | value |
      | phase0_ack | True |
      | is_parent | False |
      | child_abuse | False |
      | helper_location | False |
      | helper_age | False |
      | user_saw_helper_eligible | True |
      | help_needed | True |
      | child_home | False |
      | parent_decision | False |
    Then I should see the phrase "Based on your answer choices, consider a Temporary Agent."

  Scenario: Guardianship when parental decisions would harm the child
    Given the maximum seconds for each step is 60
    And I start the interview at "care_type_finder.yml"
    And I get to the question id "care type recommendation" with this data:
      | var | value |
      | phase0_ack | True |
      | is_parent | False |
      | child_abuse | False |
      | helper_location | False |
      | helper_age | False |
      | user_saw_helper_eligible | True |
      | help_needed | True |
      | child_home | True |
      | parent_decision | True |
    Then I should see the phrase "Based on your answer choices, consider Guardianship."
