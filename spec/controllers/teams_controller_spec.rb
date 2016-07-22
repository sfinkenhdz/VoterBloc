require 'rails_helper'

describe TeamsController do
    let(:team1) {Team.create(name: "Dinosaurs", location: "Chicago", membership_goal: 5, organizer_id: 1)}
    let(:team2) {Team.create(name: "Pigs", location: "Chicago", membership_goal: 15, organizer_id: 1)}


  describe "#new" do
    before(:each) { get :new }
    it "responds with a 200" do
      expect(response.status).to eq(200)
    end

    it "renders the new template" do
      expect(response).to render_template(:new)
    end

    # it "assigns teams to team-size arrays" do
    #   expect(assigns(:teams).length).to eq(4)
    # end
  end

  describe "#create" do
    before(:each) { get :create }
    it "responds with a 200" do
      expect(response.status).to eq(200)
    end

    it "renders the create template" do
      expect(response).to redirect_to("/")
    end

    # it "assigns teams to team-size arrays" do
    #   expect(assigns(:teams).length).to eq(4)
    # end

      # it 'assigns all users to @users' do
      # expect(assigns(:users)).to match_array users
  end

  describe "#show" do
    context 'when requested team exists' do
      # let(:team1) { :teams[rand 4] }
      team = Team.create(name: "Blah")
      before(:each) { get :show, id: team.id }

      it "responds with a 200 when" do
        expect(response.status).to eq(200)
      end

      it "assigns team to @team" do
      expect(assigns(:team)).to eq(team)
      end

      # it "renders the show template" do
      #   expect(response).to render_template(:show)
      # end


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



