class LeadsController < ApplicationController
    def index
    
    end
    
    def create     
        leads = Lead.new
        leads.full_name_lead= params[:full_name_lead]
        leads.email_lead= params[:email_lead]
        leads.phone_lead= params[:phone_lead]
        leads.company_name_leads= params[:company_name_leads]
        leads.project_name_leads= params[:project_name_leads]
        leads.project_description_leads= params[:project_description_leads]
        leads.department= params[:department]
        leads.message_leads= params[:message_leads]
        leads.workfile.attach(params[:workfile])
        leads.save!
    end
    def leads_
        render '/pages/index'
    end
    
    def show
        redirect_to '/admin/lead'
    end
end



