// enables intelligent code completion for Cypress commands
// https://on.cypress.io/intelligent-code-completion
/// <reference types="cypress" />

import 'cypress-map'
import 'cypress-plugin-steps'

it('works', () => {
  cy.step('Example step')
  cy.wrap([42]).map(String).should('deep.equal', ['42'])
})
