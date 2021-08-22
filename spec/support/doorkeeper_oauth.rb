shared_context "doorkeeper_oauth", oauth: true do
    let(:dummy_token) { double(:acceptable? => true) }
    before do
      if controller.present?
        allow(controller).to receive(:doorkeeper_token) { dummy_token }
      end
  end
end