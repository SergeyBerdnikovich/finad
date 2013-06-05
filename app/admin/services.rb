ActiveAdmin.register Service do
    form do |f|
       f.inputs "Services" do
      f.input :adviser_id
      f.input :name
      f.input :description
          f.actions
end
    end

end
