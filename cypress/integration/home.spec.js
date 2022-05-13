/// <reference types="cypress" />

describe('example to-do app', () => {

  it('should vist app homepage', () => {
    cy.visit('http://localhost:3000/')
  })

  it("should see 13 products on the page", () => {
    cy.get(".products article").should("have.length", 13);
  });

})