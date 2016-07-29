require "spec_helper"

describe Mascot::ActionControllerContext do
  subject { Mascot::ActionControllerContext.new(controller: controller, resources: resources) }
  let(:resources) { Mascot.configuration.resources }
  let(:sitemap) { Mascot.configuration.sitemap }
  let(:resource) { resources.glob("**.erb*").first }
  context "#render" do
    let(:controller) { instance_double("Controller", render: true, _layout: "application") }
    it "calls render" do
      expect(controller).to receive(:render).with(inline: resource.body,
        type: "erb",
        layout: "flipper",
        locals: {
          current_page: resource,
          cat: "in-a-hat",
          resources: resources
        },
        content_type: resource.mime_type.to_s)
      subject.render(resource, locals: {cat: "in-a-hat"}, layout: "flipper")
    end
  end
end