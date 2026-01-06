// enables intelligent code completion for Cypress commands
// https://on.cypress.io/intelligent-code-completion
/// <reference types="cypress" />

it('works', () => {
  cy.wrap(42).should('equal', 42)
})
