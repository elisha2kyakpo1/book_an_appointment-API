class DoctorSerializer
  def initialize(user:, doctor: nil)
    @doctor = doctor
    @user = user
  end

  def serialize_new_doctor()
    serialized_new_doctor = serialize_doctor(@doctor).merge(user_details)
    serialized_new_doctor.to_json
  end

  private def serialize_doctor(doctor)
    {
      doctor: {
        id: doctor.id,
        image_url: doctor.get_image_url,
        name: doctor.name,
        created_at: doctor.created_at,
        client: {
          id: doctor.user.id,
          name: doctor.user.name
        }
      }
    }
  end
end
