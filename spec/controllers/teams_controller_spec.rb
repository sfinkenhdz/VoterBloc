require 'rails_helper'

describe TeamsController do

  describe "#new" do
    before(:each) { get :new }
    it "responds with a 200" do
      expect(response.status).to eq(200)
    end

    it "renders the new template" do
      expect(response).to render_template(:new)
    end
  end

  describe "#create" do
    team = Team.new(name: "Teamy")
    before(:each) {post :create, team: { name: team.name }}

    it 'saves and assigns new team to @team' do
      team = assigns(:team)
      expect(team).to be_kind_of ActiveRecord::Base
      expect(team).to be_persisted
    end

    it "renders the create template" do
      expect(response).to redirect_to(root_url)
    end
    #when invalid
  end

  describe "#show" do
    context 'when requested team exists' do
      team = Team.create(name: "Blah")
      before(:each) { get :show, id: team.id }

      it "responds with a 200 when" do
        expect(response.status).to eq(200)
      end

      it "assigns team to @team" do
      expect(assigns(:team)).to eq(team)
      end

      it "renders the show template" do
        expect(response).to render_template(:show)
      end
    end

    context 'when requested team exists' do
      it "throws ActiveRecord::RecordNotFound" do
        expect { get :show, id: -1}.to raise_exception ActiveRecord::RecordNotFound
      end
    end
  end

  describe "#index" do
    before(:each) { get :index }
    it "responds with a 200" do
      expect(response.status).to eq(200)
    end

    it "renders the index template" do
      expect(response).to render_template(:index)
    end

    it "assigns teams to team-size arrays" do
      expect(assigns(:teams).length).to eq(4)
    end
  end

end



