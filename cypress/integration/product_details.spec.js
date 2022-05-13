/// <reference types="cypress" />

describe('example to-do app', () => {
  it("should visit root", () => {
    cy.visit("/products")
  })
  
  it("should navigate to a product detail page", () => {
    cy.contains("plants and flower").click();
  });
})