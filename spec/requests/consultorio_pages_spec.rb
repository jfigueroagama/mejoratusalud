require 'spec_helper'

describe "Consultorio Pages" do
  
  subject { page }
  
  describe "New consultorio" do
    before { visit new_consultorio_path }
    
    it { should have_selector('h1', text: 'Su Consultorio') }
    it { should have_selector('title', text: 'Su Consultorio') }
  end
  
  describe "Show consultorio" do
    let(:consultorio) { FactoryGirl.create(:consultorio) }
    before { visit consultorio_path(consultorio) }
    
    it { should have_selector('h1', text: consultorio.name ) }
    it { should have_selector('title', text: consultorio.name) }
  end
  
  describe "Create consultorio" do

    before { visit new_consultorio_path }

    let(:submit) { "Crea mi consultorio" }

    describe "with invalid information" do
      it "should not create a consultorio" do
        expect { click_button submit }.not_to change(Consultorio, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "MiBuenConsultorio"
      end

      it "should create a consultorio" do
        expect { click_button submit }.to change(Consultorio, :count).by(1)
      end
      
      describe "after saving the consultorio" do
        before { click_button submit }
        let(:consultorio) { Consultorio.find_by_name('MiBuenConsultorio') }

        it { should have_selector('title', text: consultorio.name) }
        it { should have_selector('div.alert.alert-success', text: 'Consultorio registrado exitosamente!') }
        #it { should have_link('Sign out')} # Not until I sign in
      end      
    end
  end
  
  describe "Edit consultorio" do
    let(:consultorio) { FactoryGirl.create(:consultorio) }
    before { visit edit_consultorio_path(consultorio) }

    describe "Edit consultorio page" do
      it { should have_selector('h1',    text: "Actualiza tu consultorio") }
      it { should have_selector('title', text: "Actualiza tu consultorio") }
    end

    describe "with invalid information" do
      before do
        fill_in "Name",     with: " "
      end
      before { click_button "Actualizar" }

      it { should have_content('error') }
    end
    
    describe "with valid information" do
      let(:new_name)  { "New Name" }
      before do
        fill_in "Name",             with: new_name
        click_button "Actualizar"
      end

      it { should have_selector('title', text: new_name) }
      it { should have_selector('div.alert.alert-success') }
      #it { should have_link('Sign out', href: signout_path) } # Not until sign in
      specify { consultorio.reload.name.should  == new_name }
    end
    
  end
  
end
