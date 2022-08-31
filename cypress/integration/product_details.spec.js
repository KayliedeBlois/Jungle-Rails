describe('visit products page', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000/products')
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("The user should be able to click on a product", () => {
    cy.visit('http://localhost:3000/products/1')
    cy.get("product.image.thumb.url").should("be.visible");
  });
})