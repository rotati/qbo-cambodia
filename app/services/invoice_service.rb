class InvoiceService < BaseService

  def get_all_invoices
    @invoices = []
    @items = service.query('SELECT * FROM Invoice ORDERBY MetaData.CreateTime DESC').entries
    @items.map do |item|
      invoice = Qbo::Invoice.new(item)
      invoice.customer = customers.find { |customer| customer.id == invoice.customer_id }
      invoice.customer_translation = customer_translations.find { |ct| ct.qbo_customer_id == invoice.customer_id.to_i }
      @invoices << invoice
    end
    @invoices
  end

  def all
    invoices = []
    @items = @invoices
    @items.map do |item|
      if item.doc_number.start_with?('DNRTT','RTT')
        invoice = Qbo::Invoice.new(item)
        invoice.customer = customers.find { |customer| customer.id == invoice.customer_id }
        invoice.customer_translation = customer_translations.find { |ct| ct.qbo_customer_id == invoice.customer_id.to_i }
        invoices << invoice
      end
    end
    invoices
  end

  def need_attention
    invoices = []
    @items = @invoices
    @items.map do |item|
      if !item.doc_number.start_with?('DNRTT','RTT')
        invoice = Qbo::Invoice.new(item)
        invoice.customer = customers.find { |customer| customer.id == invoice.customer_id }
        invoice.customer_translation = customer_translations.find { |ct| ct.qbo_customer_id == invoice.customer_id.to_i }
        invoices << invoice
      end
    end
    invoices
  end

  def find_by_doc_ids(doc_ids)
    query = "SELECT * FROM Invoice WHERE DocNumber LIKE '%#{doc_ids}'  ".gsub(/"/,"").gsub('[', '').gsub(']', '')
    
    @items = service.query(query).entries
    @items.map do |item|
      invoice = Qbo::Invoice.new(item)
      invoice.customer = customers.find { |customer| customer.id == invoice.customer_id }
      invoice.customer_translation = customer_translations.find { |ct| ct.qbo_customer_id == invoice.customer_id.to_i }
      invoice
    end
  end

  def all_debit
    invoices = []
    @items = @invoices
    @items.map do |item|
      if item.doc_number.start_with?('DNRTT')
        invoice = Qbo::Invoice.new(item)
        invoice.customer = customers.find { |customer| customer.id == invoice.customer_id }
        invoice.customer_translation = customer_translations.find { |ct| ct.qbo_customer_id == invoice.customer_id.to_i }
        invoices << invoice
      end
    end
    invoices
  end

  def all_invoice
    invoices = []
    @items = @invoices
    @items.map do |item|
      if item.doc_number.start_with?('RTT')
        invoice = Qbo::Invoice.new(item)
        invoice.customer = customers.find { |customer| customer.id == invoice.customer_id }
        invoice.customer_translation = customer_translations.find { |ct| ct.qbo_customer_id == invoice.customer_id.to_i }
        invoices << invoice
      end
    end
    invoices
  end

  private

  def customers
    return @customers if @customers.present?

    customer_service = CustomerService.new(qbo_credential)
    @customers = customer_service.find_by_ids(customer_ids)
  end

  def customer_translations
    @customer_translations ||= Translation::Customer.where(company_id: qbo_credential.company_id, qbo_customer_id: customer_ids, language_code: 'km')
  end

  def customer_ids
    return [] if @items.blank?
    @items.map { |invoice| invoice.customer_ref.value }
  end

  def service_class
    Quickbooks::Service::Invoice
  end
end
