require 'rails_helper'

RSpec.describe NotesController, type: :controller do
  let(:user) { double("user") }
  let(:project) { instance_double("Project", owner: user, id: "123") }

  before do
    allow(request.env["warden"]).to receive(:authenticate!).and_return(user)
    allow(controller).to receive(:current_user).and_return(user)
    allow(Project).to receive(:find).and_return(project)
  end

  describe "#index" do
    it "入力されたキーワードでメモを検索すること" do
      expect(project).to receive_message_chain(:notes, :search).
        with("rotate tires")
      get :index,
        params: { project_id: project.id, term: "rotate tires" }
    end
  end
end