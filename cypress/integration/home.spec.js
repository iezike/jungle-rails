/// <reference types="cypress" />

describe('Home page features', () => {

  it('should vist app homepage', () => {
    cy.visit('http://localhost:3000/')
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("should see 13 products on the page", () => {
    cy.get(".products article").should("have.length", 13);
  });

})